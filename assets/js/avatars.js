// Generar un número aleatorio para la semilla
function generateRandomSeed() {
    return Math.floor(Math.random() * 10000); // Genera un número entre 0 y 9999
}

// Al cargar la página, actualiza el avatar
document.addEventListener("DOMContentLoaded", function () {
    const randomSeed = generateRandomSeed(); // Generar la semilla aleatoria
    const newAvatarUrl = `https://api.dicebear.com/9.x/notionists/svg?seed=random${randomSeed}&size=60&body=variant22`;
    
    // Cambiar el atributo src del avatar
    const avatarElement = document.getElementById('avatar');
    avatarElement.src = newAvatarUrl;
});