import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;

Sampler     jumpS;
int jumping=-1;

void minimSetup(){
  minim = new Minim(this);
  out   = minim.getLineOut();
  jumpS  = new Sampler( "jump_02.wav", 4, minim );
  jumpS.patch( out );
}