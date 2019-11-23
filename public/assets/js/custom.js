/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */
var CLOUDINARY_URL="https://api.cloudinary.com/v1_1/dxql9aygi/image/upload";
var CLOUDINARY_UPLOAD_PRESET = "ml_default"


var fileUpload = $("#img_uploader");
var imgPreview = $("#img_preview");
fileUpload.on("change", function(e){
 var file = e.target.files[0];
 var formData = new FormData();
 formData.append('file', file);
 formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);
 fileUpload.parent().children()[1].innerHTML = file.name

 axios(CLOUDINARY_URL, {
     method: 'post',
     headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
     },
     data: formData
 }).then((res) =>{
    $('#img_pub_id').val(res.data.public_id)
    imgPreview[0].src = res.data.secure_url

    console.log($('#img_pub_id').val());
 }).catch((err) => {
    console.log(err);
 });
});