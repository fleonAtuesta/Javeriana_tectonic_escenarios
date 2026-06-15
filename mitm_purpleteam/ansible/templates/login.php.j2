<?php
// ============================================================
// Aplicación Web Vulnerable - Ciber Range MITM
// Generada por Tectonic con flags dinámicas por instancia
// USO EXCLUSIVAMENTE EDUCATIVO
// ============================================================
session_start();
$error = "";
$flag  = "";

// Credenciales con flags únicas por instancia (inyectadas por Tectonic)
$users = [
    "admin"   => ["password" => "admin123",    "flag" => "{{ parameters['flags']['http_flag_alpha'] }}"],
    "jperez"  => ["password" => "empresa2024", "flag" => "{{ parameters['flags']['http_flag_beta']  }}"],
    "mgarcia" => ["password" => "password1",   "flag" => "{{ parameters['flags']['http_flag_gamma'] }}"],
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST['username'] ?? '';
    $pass = $_POST['password'] ?? '';

    // Log para captura por Suricata/Wazuh
    error_log("[AUTH] Login attempt user=$user from=" . $_SERVER['REMOTE_ADDR']);

    if (isset($users[$user]) && $users[$user]['password'] === $pass) {
        $_SESSION['user'] = $user;
        $flag = $users[$user]['flag'];
        // Cookie sin Secure ni HttpOnly (deliberadamente vulnerable)
        setcookie("session_token", md5($user . time()), 0, "/", "", false, false);
    } else {
        $error = "Credenciales invalidas";
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Intranet Corporativa - Login</title>
    <style>
        body { font-family: Arial, sans-serif; background:#f0f2f5; display:flex; align-items:center; justify-content:center; height:100vh; margin:0; }
        .box { background:white; padding:40px; border-radius:8px; box-shadow:0 2px 10px rgba(0,0,0,0.1); width:350px; }
        h2 { text-align:center; color:#333; margin-bottom:30px; }
        input { width:100%; padding:10px; margin:8px 0; border:1px solid #ddd; border-radius:4px; box-sizing:border-box; }
        button { width:100%; padding:12px; background:#0066cc; color:white; border:none; border-radius:4px; cursor:pointer; font-size:16px; }
        .error { color:red; text-align:center; margin-top:10px; }
        .flag  { color:green; background:#e8f5e9; padding:10px; border-radius:4px; text-align:center; font-family:monospace; }
        .warn  { background:#fff3e0; border:1px solid #ff9800; padding:10px; border-radius:4px; font-size:12px; color:#e65100; margin-bottom:20px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Intranet Corporativa</h2>
    <div class="warn">HTTP sin cifrado - Entorno de laboratorio</div>
    <?php if ($flag): ?>
        <div class="flag">
            Login exitoso!<br><br>
            <?= htmlspecialchars($flag) ?>
        </div>
        <p style="text-align:center;margin-top:15px;font-size:12px;color:#666;">
            Cookie de sesion: <code><?= $_COOKIE['session_token'] ?? 'N/A' ?></code>
        </p>
    <?php else: ?>
    <form method="POST" action="">
        <input type="text"     name="username" placeholder="Usuario"     required autocomplete="off">
        <input type="password" name="password" placeholder="Contrasena"  required>
        <button type="submit">Iniciar Sesion</button>
    </form>
    <?php if ($error): ?>
        <p class="error"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>
    <?php endif; ?>
</div>
</body>
</html>
