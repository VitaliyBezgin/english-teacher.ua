import 'axios';

window.onload = function (){
    let word_form = $('.word_form');
    let i = 0;

    $(word_form[i]).fadeIn();

    word_form.submit(function (e){
        e.preventDefault();

        let this_form = this;
        let user_answer = word_form.find($('.answer'));
        let last_word = word_form.length;

        axios.post('http://english-teacher.ua/check/answers', {
            word: user_answer.val(),
            id:user_answer.attr('data-id'),
            last:false
        })
            .then(function (response) {

                $(this_form).find($('.result')).text(response.data)

                setTimeout(function (){
                    $(word_form[i]).fadeOut();

                    this_form.remove();

                    i++

                    $(word_form[i]).fadeIn();
                }, 3000)

                console.log(response.data)
            })
            .catch(function (error) {
                console.log(error);
            });
    })
}
