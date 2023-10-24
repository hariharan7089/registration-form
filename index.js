const passwordInput = document.getElementById('password');
const passwordStrength = document.getElementById('password-strength');
const confirmPassword= document.getElementById('confirm-password');
const confirmStrength=document.getElementById('confirm-password-strength');
const submit = document.getElementById('submit');
const form=document.getElementById('form');
passwordInput.addEventListener('input',()=>{
    passwordStrength.innerHTML=getStrength(passwordInput);
});
confirmPassword.addEventListener('input',()=>{
    confirmStrength.innerHTML=getStrength(confirmPassword);
});

form.addEventListener('submit', () => {

    if (passwordInput.value === confirmPassword.value) {
      window.alert("Registration Successful");
    } else {
      window.alert("Password Mismatch");
    }
  });

const getStrength=(password)=>{

if (password.value.length < 6){
  
    return "weak";
}
else if(password.value.length>=6 && password.value.length<=8) {
    return "medium";
}
else{
    return "strong";
}
}
