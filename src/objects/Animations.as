package objects 
{
	import starling.display.Sprite;
	import flash.utils.Dictionary;
	import starling.textures.TextureAtlas;
	import starling.animation.Juggler;
	import starling.textures.Texture;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Animations extends Sprite 
	{
		
		private var _animations:Dictionary;
		private var _atlas:TextureAtlas;
		private var _currentAnimation:String;
 
		public function Animation(atlas:TextureAtlas)
		{
            _animations = new Dictionary();
            _atlas = atlas;
		}
 
		public function play(name:String):void
		{
            if (_currentAnimation == name)
                return;
 
            if (!_animations[name])
                throw new Error("No animation called " + name);
 
            if (_currentAnimation)
            {
				(_animations[_currentAnimation] as MovieClip).stop();
                removeChild(_animations[_currentAnimation]);
                Starling.juggler.remove(_animations[_currentAnimation]);
            }
 
           (_animations[name] as MovieClip).play();
			addChild(_animations[name]);
			Starling.juggler.add(_animations[name]);
            _currentAnimation = name;
		}
 
		public function addAnimation(name:String, frameRate:int,loop:Boolean):void
		{
            var newMC:MovieClip = new MovieClip(_atlas.getTextures(name), frameRate); //Buscar en atlas la animacion
			newMC.loop = loop;
            _animations[name] = newMC; //Anyade al diccionario
			
		}
		
		public function AnimationCompleted(name:String):Boolean
		{
			return (_animations[name] as MovieClip).isPlaying;
		}
		
	}

}