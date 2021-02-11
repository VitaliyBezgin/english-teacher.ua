window.onload = function (){
    let add_button = $('.add-new'),
        questions_box = $('.questions-box'),
        save_question = $('.save-question'),
        questions_field = $('.questions-field')

    add_button.click(function (){
        questions_box.append(
            "<h4>Question text</h4>"+
            "<hr>"+
            "<h5>Correct question id </h5>"+
            "<p><input type='number' class='tmp-input-answer-id' required></p>"+
            "<h5>Question text</h5>"+
            "<input type='text' class='tmp-input-question form-control' required style='height: 60px;'>"+
            "<hr>"+
            "<h5>Answer options</h5>"+
            "<input type='text' class='tmp-input-question-options form-control' required style='height: 100px;'>"
        )
    })

    save_question.click(function (){
        addQuestion({
            id:$('.tmp-input-answer-id'),
            question:$('.tmp-input-question'),
            question_option:$('.tmp-input-question-options')
        })
    })
}

function addQuestion(data){

}
