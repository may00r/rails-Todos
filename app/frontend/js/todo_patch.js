$(document).ready(function() {
    $('input:checkbox').change( function () {
        var formData = $(this).parents("form").serialize();
        var url = $(this).parents("form").prop('action');
        console.log('Posting the following: ', formData);
        console.log(url);

        $.ajax({
            url: url,
            data: formData,
            type: 'PATCH',
            dataType : 'json',
            success: function (data) {
                console.log(data);
            }
        });
    });
});
