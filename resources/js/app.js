require('./bootstrap');

require('alpinejs');

$(function (){
    let best_students = $('.best-students')

    best_students.slick({
        vertical:true,
        infinite: true,
        slidesToShow: 7,
        slidesToScroll: 3,
        dots:false,
        autoplaySpeed:5000,
        arrows: false,
        autoplay:true
    });

    opponentForm()
})

/*
* opponent form logic
* */
function opponentForm(){
    let opponentForm = $('#opponent-form')

    opponentForm.submit(function (e){
        e.preventDefault()

        let selected_opponent_id = $('#opponent-select option:selected').val(),
            selected_words_id = $('#words-select option:selected').val(),
            striker_id = $('.striker_id').val(),
            prepare_url = window.location.origin

        window.location = prepare_url+"/opponents/fight/striker/"+striker_id+"/defender/"+selected_opponent_id+"/words/"+selected_words_id
    })
}
