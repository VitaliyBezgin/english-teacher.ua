import axios from "axios"

const getFriends = function (){
const APP_NAME = 'Laravel-super-unique-name'

    let friendsList = [];

    axios.post('http://english-teacher.ua/friendsList', '', {
        headers:{
            appName:APP_NAME
        }
    }).then((res) =>{

        let potentialFriends = res.data.potentialFriends;

        console.log(potentialFriends)

        for (let i = 0; i < potentialFriends.length; i++){
            friendsList.push(potentialFriends[i])
        }
        // console.log(potentialFriends)

        $( "#friend" ).autocomplete({
            source:friendsList,
            select:function(e, ui){
                console.log(ui)
                this.value = ui.item.label
                $('.friend_id').val(ui.item.value)
                return false
            }
        });
    }).catch((error) =>{
        console.log(error)
    })
}

getFriends()
