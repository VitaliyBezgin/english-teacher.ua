import 'axios'

window.onload = function (){
    let wordForms = $('.word_form'),
        i = 0,
        word_list_id = $('#words_list_id').text(),
        buttonToggle = true;

        //show first form
    $(wordForms[i]).fadeIn();

    $('form').submit(function (e){
        e.preventDefault()

        if (buttonToggle === true){

            buttonToggle = false

            let word_id = $(this).find('input[name=word]').data('id'),
                answer = $(this).find('input[name=word]').val()

            axios.post("http://english-teacher.ua/check-words", {
                answer: answer,
                word_id: word_id,
                words_list_id:word_list_id
            })
                .then(function (response) {
                   let server_response = response.data
                    console.log(server_response)
                    if (server_response.result === 'true'){
                        $(wordForms[i]).find('.result').text(server_response.icon)
                    }
                    if(server_response.result === 'wrong'){
                        $(wordForms[i]).find('.result').html(server_response.icon+ " <span> "+server_response.origin+"</span>")
                    }
                    if (server_response.message !== undefined) {
                        $('.message').append("<p>"+server_response.message+"</p>")
                    }
                    if (server_response.status === 'finished'){
                        //show button for download words file
                        $('#getWordsFile').fadeIn()

                        $('.words-list').after("<button type='button' class='btn btn-outline-dark try_again'>Try again</button>")
                    }
                    setTimeout(function (){
                        $(wordForms[i]).remove()

                        i++

                        buttonToggle = true

                        $(wordForms[i]).fadeIn()
                    }, 1500)

                    $('.try_again').click(function (){
                        window.location = window.location.href
                    })

                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
}
