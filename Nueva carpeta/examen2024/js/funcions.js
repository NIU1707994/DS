async function ampliaMissatge(id) {
    var answer = await fetch("/controladors/c_missatge.php?IDElement="+id)
    var answerTxt = await answer.text();
    document.getElementById(id).innerHTML = answerTxt;
}