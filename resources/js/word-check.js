import 'axios'

window.onload = function (){
    let word_form = $('.word_form')
    let i = 0
    let increment_answers = 0
    let block_btn = true

    $(word_form[i]).fadeIn();

    word_form.submit(function (e){
        e.preventDefault()

        let this_form = this;
        let user_answer = word_form.find($('.answer'))

        if (block_btn !== false){

            increment_answers++

            block_btn = false

            axios.post('http://english-teacher.ua/check/answers', {
                word: user_answer.val(),
                id:user_answer.attr('data-id'),
                answer_count:increment_answers
            })
                .then(function (response) {

                    let server_response = response.data;

                    $(this_form).find($('.result')).text(server_response.result)

                    if (server_response.message !== undefined){
                        $(this_form).find($('.result')).text(server_response.result+ ' ' + server_response.message)
                    }

                    setTimeout(function (){
                        $(word_form[i]).fadeOut()

                        this_form.remove()

                        i++

                        $(word_form[i]).fadeIn()

                        block_btn = true

                    }, 1000)

                    console.log(server_response)
                    if (server_response.status === 'final'){
                        let words_list = $('.words-list')

                        words_list.after("<button type='button' class=' btn btn-outline-dark try_again'>Try again</button>")

                        $('.try_again').click(function (){
                           window.location = window.location.href
                        })
                    }
                })
                .catch(function (error) {
                    console.log(error)
                });
        }
    })
}
