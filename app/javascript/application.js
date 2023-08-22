// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("DOMContentLoaded", function () {
    const fileInput = document.getElementById("file-input");
    const form = document.getElementById("image-upload-form");
    const maxFiles = 10;

    fileInput.addEventListener("change", function () {
        // Count existing files
        const existingFiles = document.querySelectorAll('.image-wrapper').length;
        if (existingFiles + 1 > maxFiles) {
            alert("You can only upload a maximum of 10 files");
            fileInput.value = ''; // clear the input
            return false;
        }
        if (fileInput.files.length > 0) {
            form.submit();
        }
    });
});