import { Application } from "@hotwired/stimulus"

const application = Application.start()

application.debug = false
window.Stimulus = application

document.addEventListener("turbo:load", function () {
    document.addEventListener("turbo:stream", function (event) {
        const detail = event.detail;
        if (detail && detail.target && detail.template) {
            const targetFrame = detail.target;
            const template = detail.template;
            const turboFrame = document.querySelector('[data-turbo-frame="image_upload"]');
            if (turboFrame) {
                turboFrame.innerHTML = template;
            }
        }
    });
    document.addEventListener("turbo:stream:remove", function (event) {
        const detail = event.detail;
        if (detail && detail.target) {
            const targetFrame = detail.target;
            const turboFrame = document.querySelector(`[data-turbo-frame="image_upload"]`);
            if (turboFrame) {
                turboFrame.remove();
            }
        }
    });
});


export { application }


