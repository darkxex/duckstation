/*
[configuration]

[OptionRangeFloat]
GUIName = Curve
OptionName = X_CURVE
MinValue = 1.0
MaxValue = 6.0
StepAmount = 0.1
DefaultValue = 2.0


[/configuration]
*/



void main()
{ vec4 color = Sample();
  vec2 uv = GetCoordinates();
  vec2 ts = GetInvResolution();
	uv = (uv - 0.5) * 2.0;
	uv *= 1.1;	
	uv.x *= 1.0 + pow((abs(uv.y) / 5.0), X_CURVE);
	uv  = (uv / 2.0) + 0.5;
	uv =  uv *0.92 + 0.04;
 
  vec4 sum2 = vec4(0.0, 0.0, 0.0, 0.0);
  sum2 =  SampleLocation(uv);
  SetOutput(saturate(sum2));
}