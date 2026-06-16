-- auth_id_template.sql
-- Copia este archivo y reemplaza los valores AUTH_ID_* por los IDs reales de Supabase Auth.
-- Luego ejecuta este archivo contra tu base de datos Supabase.

-- Ejemplo de actualización de auth_id para admins
update public.users set auth_id = '6236ac51-92c5-4b0d-ae26-4ba862afab65' where username = 'tibisay';
update public.users set auth_id = 'f54326c0-7e31-4b1b-b39f-cc391b5afd07' where username = 'diego';
update public.users set auth_id = 'd1582ad5-359d-4d3e-8df7-1bbd2ab53739' where username = 'daniela';

-- Ejemplo de actualización de auth_id para choferes de prueba
update public.users set auth_id = 'b5addc9e-2671-46f1-abc1-32f0838a95f5' where username = 'pedro';
update public.users set auth_id = '444fb87b-5e72-4e47-820d-27931c89184d' where username = 'juan';
update public.users set auth_id = 'f80a6b0b-fb4b-4277-9b5d-e24d3cf8a9bd' where username = 'maria';

-- Si necesitas insertar un usuario nuevo en public.users con auth_id:
-- insert into public.users (username, role, auth_id) values ('NOMBRE_USUARIO', 'user', 'REAL_AUTH_ID');
-- on conflict (username) do update set auth_id = coalesce(public.users.auth_id, excluded.auth_id), role = excluded.role;
