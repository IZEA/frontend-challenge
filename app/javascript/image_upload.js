document.addEventListener("DOMContentLoaded", () => {
    const imageInput = document.getElementById("imageInput");
    const uploadButton = document.getElementById("uploadButton");

    uploadButton.addEventListener("click", async () => {
        const formData = new FormData();

        Array.from(imageInput.files).forEach((file) => {
            formData.append("images[]", file);
        });

        try {
            const response = await fetch("/upload_images", {
                method: "POST",
                body: formData,
            });

            if (response.ok) {
                // Handle successful upload, e.g., update gallery using Turbo Streams
                console.log("Images uploaded successfully");
            } else {
                console.error("Image upload failed");
            }
        } catch (error) {
            console.error("Error uploading images:", error);
        }
    });
});
