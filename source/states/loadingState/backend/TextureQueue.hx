package states.loadingState.backend;

import openfl.display.BitmapData;
import flixel.graphics.FlxGraphic;
import states.loadingState.LoadingState;
import openfl.display3D.textures.TextureBase;

class TextureQueue
{
    private static var queue:Array<{file:String, bitmap:BitmapData}> = [];
    private static var isLoading:Bool = false;

    static public function cacheBitmap(file:String, ?bitmap:BitmapData = null)
	{
        if (bitmap == null) return;

        if (isLoading)
        {
            queue.push({file: file, bitmap: bitmap});
            return;
        }

        isLoading = true;
        
        Cache.localTrackedAssets.push(file);
            
        var newGraphic:FlxGraphic = FlxGraphic.fromBitmapData(bitmap, false, file);
        newGraphic.persist = true;
        newGraphic.destroyOnNoUse = false;
        newGraphic.bitmap.getTexture(FlxG.stage.context3D);
        Cache.currentTrackedAssets.set(file, newGraphic);
        endCallback();
	}

    static function endCallback():Void
    {
        isLoading = false;
        if (LoadingState.instance != null)
            LoadingState.instance.addLoadCount();

        if (queue.length > 0)
        {
            var next = queue.shift();
            cacheBitmap(next.file, next.bitmap);
        }
    }
}
