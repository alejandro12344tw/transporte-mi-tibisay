Ejemplos de prueba para Supabase (Mi Tibisay)

Archivos:
- admin_example.html: interfaz simple para autenticarse como admin y crear una carga.
- driver_example.html: interfaz para autenticarse como chofer, listar cargas y aceptar una carga.

Requisitos previos:
1) Ejecuta `supabase_setup.sql` en tu proyecto Supabase (ya generado en el repo).
2) Crea usuarios en Auth (supabase auth) con email/password:
   - admin@tibisay.local / adminpass  (o el que prefieras)
   - driver@tibisay.local / driverpass
3) En la tabla `public.users` añade o actualiza la columna `auth_id` para los usuarios:
   - Para el admin, establece `auth_id` = el `id` del usuario creado en `auth.users`.
   - Para el chofer, establece `auth_id` = el `id` del usuario creado en `auth.users` y `username` con el nombre que usarás (ej: 'pedro').

Cómo probar:
1) Abre `examples/admin_example.html` en el navegador (doble clic o arrastrar a una pestaña).
2) Autentica con el admin y pulsa "Insertar Carga".
3) Abre `examples/driver_example.html`, autentica como chofer y pulsa "Listar Cargas Disponibles".
4) Pulsa "Aceptar" en una carga libre; el driver intentará actualizar `assignedTo` con su `username`.

Notas de seguridad:
- Estos ejemplos usan la `anon` key en el navegador con Supabase JS. Solo para pruebas y desarrollo.
- Para producción, habilita Auth, usa políticas RLS y evita exponer la `service_role` o llaves sensibles en el cliente.

Si quieres, puedo:
- Generar un pequeño script Node.js para automatizar pruebas desde la terminal.
- Ajustar las páginas para mostrar el username correctamente y manejar mejor sesiones.
