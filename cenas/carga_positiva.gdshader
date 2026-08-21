shader_type canvas_item;

void fragment() {
    vec2 uv = UV;

    vec2 p = uv - vec2(0.5);

    vec2 luz = normalize(vec2(-0.6, -0.8));

    float r2 = dot(p, p);

    if (r2 > 0.25) {
        discard;
    }

    float z = sqrt(0.25 - r2);
    vec3 normal = normalize(vec3(p, z));

    float brilho = max(dot(normal, vec3(luz, 0.8)), 0.0);

    vec3 base = vec3(0.95, 0.03, 0.08);

    vec3 final_color = base * (0.35 + brilho * 0.9);

    float reflexo = smoothstep(
        0.18,
        0.0,
        distance(uv, vec2(0.30, 0.27))
    );

    final_color += vec3(1.0) * reflexo * 0.45;

    COLOR = vec4(final_color, 1.0);
}