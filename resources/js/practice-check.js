import 'axios'

window.onload = function (){
 let practiceForms = $('.exercises-box form'),
     i = 0,
     buttonToggle = true;

    //show first form
    $(practiceForms[i]).fadeIn()

   $('form').submit(function (e){
        e.preventDefault()

        if (buttonToggle !== false){
            buttonToggle = false

            let practice_id = $('#practice_id').text(),
                question_index = $(practiceForms[i]).data('question-index'),
                answer_index = $(practiceForms[i]).find($('input[name=answer]:checked'));

            axios.post('http://english-teacher.ua/theory-practice-check', {
                practice_id:practice_id,
                question_index:question_index,
                answer_index:answer_index.val()
            }).then(function (response){
                let server_response = response.data

                setTimeout(function (){
                    $(practiceForms[i]).remove()

                    i++

                    $(practiceForms[i]).fadeIn()
                },1500)

                if (server_response.status === 'true'){
                    $(practiceForms[i]).find($('.form-control')).parent().css('background', 'pink')
                    answer_index.parent().css('background', 'green')
                }
                if (server_response.status === 'wrong'){

                }
                if (server_response.status === 'finished'){
                    $('.message').text(server_response.message)
                }

                buttonToggle = true;
            }).catch(function (error) {
                console.log(error);
            });
        }
    })
}
