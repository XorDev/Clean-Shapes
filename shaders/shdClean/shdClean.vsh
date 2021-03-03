                                //CIRCLE:                     RECTANGLE:                    LINE:                CONVEX:
attribute vec3 in_Position;     //XY, type                    XY, type                      XY, type             XY, type
attribute vec3 in_Normal;       //Circle XY, radius           Rect XY, unused               x1, y1, unused       First boundary
attribute vec4 in_Colour1;      //Fill colour                 Fill colour                   Fill colour          Fill colour
attribute vec3 in_Colour2;      //unused                      Rect WH, unused               x1, x2, unused       Second boundary
attribute vec4 in_Colour3;      //Border colour               Border colour                 Unused               Border colour
attribute vec2 in_TextureCoord; //unused, border thickness    Rounding, border thickness    Thickness, unused    Rounding, border thickness

//Shared
varying vec2  v_vPosition;
varying float v_fMode;
varying vec4  v_vFillColour;
varying float v_fBorderThickness;
varying vec4  v_vBorderColour;
varying float v_fRounding;

//Circle
varying vec3 v_vCircleXYR;

//Rectangle
varying vec2 v_vRectangleXY;
varying vec2 v_vRectangleWH;

//Line
varying vec2  v_vLineA;
varying vec2  v_vLineB;
varying float v_fLineThickness;

//Convex
varying vec3 v_vLine1;
varying vec3 v_vLine2;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(in_Position.xyz, 1.0);
    
    //Shared
    v_fMode            = in_Position.z;
    v_vFillColour      = in_Colour1;
    v_vBorderColour    = in_Colour3;
    v_fBorderThickness = in_TextureCoord.y;
    
    //Circle
    v_vCircleXYR       = in_Normal;
    
    //Rectangle
    v_vRectangleXY     = in_Normal.xy;
    v_vRectangleWH     = in_Colour2.xy;
    v_fRounding        = in_TextureCoord.x;
    
    //Line
    v_vLineA           = in_Normal.xy;
    v_vLineB           = in_Colour2.xy;
    v_fLineThickness   = in_TextureCoord.x;
    
    //Polygon
    v_vPosition        = in_Position.xy;
    v_vLine1           = in_Normal;
    v_vLine2           = in_Colour2;
    //v_fRounding        = in_TextureCoord.x * tan(0.5*acos(dot(v_vLine1.xy, v_vLine2.xy)));
}