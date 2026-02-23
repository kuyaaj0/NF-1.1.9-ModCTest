package backend;

package backend;

class MemoryUtil {
    /**
     * 预热堆内存。
     * 
     * @param targetSizeMB 你希望预先申请的内存大小（MB）。例如 100MB。
     * 建议设置为游戏峰值内存的 1.2 倍左右。
     */
    public static function warmUpHeap(targetSizeMB:Int):Void {
        trace('Starting Heap Warm-up: target ${targetSizeMB} MB...');
        
        var startMem = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_USAGE);
        var targetBytes = targetSizeMB * 1024 * 1024;
        
        // 1. 设置一个巨大的最小工作内存，防止 GC 在预热过程中捣乱
        // 这样 hxcpp 会认为“还没到阈值呢”，拼命向 OS 申请内存而不回收
        var oldMinMem = getMinWorkingMemory(); // 假设你有办法获取，或者就记住默认值
        cpp.vm.Gc.setMinimumWorkingMemory(targetBytes);
        
        // 2. 疯狂创建对象（制造垃圾）来填充堆
        // 使用简单的 Int 数组或 Bytes，分配速度快且开销小
        var dummy:Array<haxe.io.Bytes> = [];
        var allocated = 0;
        var chunkSize = 1024 * 1024; // 每次申请 1MB
        
        try {
            while (allocated < targetBytes) {
                // 申请 1MB 的块
                dummy.push(haxe.io.Bytes.alloc(chunkSize));
                allocated += chunkSize;
                
                // 打印进度，避免以为死机
                if (allocated % (50 * 1024 * 1024) == 0) {
                    trace('  Allocated: ${Std.int(allocated / 1024 / 1024)} MB');
                }
            }
        } catch (e:Dynamic) {
            trace("Warm-up stopped early (OOM risk): " + e);
        }
        
        trace('Warm-up allocation done. Cleaning up...');
        
        // 3. 释放引用
        dummy = null; // 切断引用，让它们变成垃圾
        
        // 4. 强制 GC
        // 这次 GC 会回收所有 dummy 对象，但 hxcpp 会保留底层的系统内存块
        // 注意：不要调用 compact()，否则内存又还给 OS 了！只运行 run(true)
        cpp.vm.Gc.run(true);
        cpp.vm.Gc.run(true); // 跑两次确保彻底（特别是针对 finalizers）
        
        // 5. 恢复配置（可选）
        // 你可以保持 setMinimumWorkingMemory 不变，这样 GC 阈值会一直很高
        // 或者恢复成动态策略
        // cpp.vm.Gc.setMinimumWorkingMemory(oldMinMem); 
        
        var endMem = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_USAGE);
        var reserved = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_RESERVED);
        
        trace('Heap Warm-up Complete.');
        trace('  Used Memory: ${Std.int(endMem / 1024 / 1024)} MB');
        trace('  Reserved Heap: ${Std.int(reserved / 1024 / 1024)} MB (Ready for use!)');
    }
    
    // 辅助获取当前配置（hxcpp 没有直接的 get 方法，这里只是示意）
    static function getMinWorkingMemory():Int return 1024 * 1024 * 20; // 默认 20MB
}