shader_type canvas_item;

varying vec2 global_coords;

uniform float w = 64.0;
uniform float h = 32.0;

uniform vec4 color1 : source_color = vec4(0.06, 0.06, 0.06, 1.0);
uniform vec4 color2 : source_color = vec4(0.08, 0.08, 0.08, 1.0);
uniform float speed = 32.0;

void vertex() {
	global_coords = (MODEL_MATRIX * vec4(VERTEX, 1.0, 1.0)).xy;
}

void fragment() {
	float x = global_coords.x;
	float y = global_coords.y + ceil(TIME * speed);

	float x_i = floor(x / w);
	float y_i = floor(y / h);
	float sub_x = mod(x, w);
	float sub_y = mod(y, h);

	float mask = 0.0;
	if (mod(x_i, 2) < 0.0001) {
		mask = sub_x + sub_y * w / h <= w ? 1.0 : 0.0;
	} else {
		mask = w - sub_x + sub_y * w / h <= w ? 1.0 : 0.0;
	}

	if (abs(1.0 - mod(y_i, 2)) < 0.0001) {
		mask = 1.0 - mask;
	}

    float pattern_mask = mod(x + mod(y, 2.0), 8.0);
    COLOR = mix(color1, color2, mask);
}