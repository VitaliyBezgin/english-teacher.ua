import 'axios'

window.onload = function (){
    let exercises_box = $('.exercises-box'),
        theory_body = $('.theory-body'),
        start_practice = $('#start-practice');

    start_practice.click(function (){
        exercises_box.fadeIn()
        theory_body.fadeOut()
        if ($(this).data('type') === 'button'){
            $(this).text('Try again')
            $(this).removeClass('btn-dark')
            $(this).addClass('btn-warning')
            $(this).data('type', 'link')
        }else{
            window.location = window.location.href
        }

    })


 let practiceForms = $('.exercises-box form'),
     i = 0,
     buttonToggle = true;
    //show first form
    $(practiceForms[i]).fadeIn()

    //checking practice answers
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
                },2000)

                if (server_response.status === 'true' || server_response.status === 'finished'){
                    $(practiceForms[i]).find($('.form-control')).parent().css('background', 'pink')
                    answer_index.parent().css('background', 'green')
                }
                if (server_response.status === 'wrong' || server_response.status === 'finished'){
                    let inps = $(practiceForms[i]).find($('.form-control'));
                    for(let f = 0; f < inps; f++){
                        if ($(inps[f]).data('id') === server_response.origin){
                            $(inps[f]).parent().css('background', 'green')
                        }
                        $(inps[f]).parent().css({
                            'text-decoration':'line-through',
                            'background':'pink'
                        })
                    }
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
