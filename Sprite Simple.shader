Shader "Sprites/Simple"
{
	Properties
	{
		[PerRendererData] _MainTex("Sprite Texture", 2D) = "white" {}
		_Color("Tint", Color) = (1,1,1,0.4)
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Geometry"
		}

		Pass
		{
			Cull front

			CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

			fixed4 vert(fixed4 IN : POSITION) : SV_POSITION
			{
				return UnityObjectToClipPos(IN);
			}

			fixed4 _Color;

			fixed4 frag(fixed4 IN : SV_POSITION) : COLOR
			{
				fixed4 col = _Color;
				col.rgb *= col.a;
				return col;
			}

			ENDCG
		}
	}

	Fallback "Transparent/VertexLit"
}