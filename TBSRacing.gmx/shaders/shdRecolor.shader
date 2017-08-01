//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec4 toGrayscale(in vec4 col)
{
    float average = (col.r + col.g + col.b) / 3.0;
    return vec4(average, average, average, 1.0);
}

vec4 colorize(in vec4 grayscale, in vec4 col)
{
    return (grayscale * col);
}

uniform vec4 colorTo;

void main()
{
    gl_FragColor = v_vColour; 
    vec4 grayscale = toGrayscale(v_vColour);
    
    gl_FragColor = colorize(grayscale, colorTo) * texture2D( gm_BaseTexture, v_vTexcoord );
}
