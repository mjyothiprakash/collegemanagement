<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Student</title>
	  <style>
	  	    *{
	    	box-sizing: border-box;
	    
	    }
        body {
            background-image: linear-gradient(to right,#FF9800,#E65100);
            font-family: Arial, sans-serif;
        }

        
        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            margin-top:70px;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
        }
        
        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        
        .form-actions {
            text-align: center;
        }

        .form-actions button {
            padding: 10px 20px;
            background-color: #4A148C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-actions button.cancel {
            background-color: red;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Login</h2>
        <form:form onsubmit="return validateForm()" action="facultyaddstudent" modelAttribute="fstudentreg">
            <label for="sid">Student ID:</label>
            <input type="text" id="sid" name="sid" required>
            <div class="error-message" id="sid-error"></div>
            
            <label for="sname">Name:</label>
            <input type="text" id="sname" name="sname" required>
            <div class="error-message" id="sname-error"></div>
            
            <label for="smail">Email:</label>
            <input type="email" id="smail" name="smail" required>
            <div class="error-message" id="smail-error"></div>
            
            <label for="spassword">Password:</label>
            <input type="password" id="spassword" name="spassword" required>
            <div class="error-message" id="spassword-error"></div>
            
            <label for="sphoneno">Phone Number:</label>
            <input type="text" id="sphoneno" name="sphoneno" required>
            <div class="error-message" id="sphoneno-error"></div>
            
            <label for="sdob">Date of Birth:</label>
            <input type="date" id="sdob" name="sdob" required>
            <div class="error-message" id="sdob-error"></div>
            
            <label for="sgender">Gender:</label>
            <select id="sgender" name="sgender" required>
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <div class="error-message" id="sgender-error"></div>
            
            <label for="sfathername">Father's Name:</label>
            <input type="text" id="sfathername" name="sfathername" required>
            <div class="error-message" id="sfathername-error"></div>
            
            <label for="smothername">Mother's Name:</label>
            <input type="text" id="smothername" name="smothername" required>
            <div class="error-message" id="smothername-error"></div>
            
            <label for="saddress">Address:</label>
            <input type="text" id="saddress" name="saddress" required>
            <div class="error-message" id="saddress-error"></div>
            <div class="form-actions">
		        <button type="submit">Submit</button>
	            <button type="button" class="cancel" onclick="goBack()">Cancel</button>
            </div>
        </form:form>
        
    </div>
    
    
    <script>
        function validateForm() {
            var sid = document.getElementById("sid").value;
            var sname = document.getElementById("sname").value;
            var smail = document.getElementById("smail").value;
            var spassword = document.getElementById("spassword").value;
            var sphoneno = document.getElementById("sphoneno").value;
            var sdob = document.getElementById("sdob").value;
            var sgender = document.getElementById("sgender").value;
            var sfathername = document.getElementById("sfathername").value;
            var smothername = document.getElementById("smothername").value;
            var saddress = document.getElementById("saddress").value;
            
            var sidError = document.getElementById("sid-error");
            sidError.innerHTML = "";
            
            var snameError = document.getElementById("sname-error");
            snameError.innerHTML = "";
            
            var smailError = document.getElementById("smail-error");
            smailError.innerHTML = "";
            
            var spasswordError = document.getElementById("spassword-error");
            spasswordError.innerHTML = "";
            
            var sphonenoError = document.getElementById("sphoneno-error");
            sphonenoError.innerHTML = "";
            
            var sdobError = document.getElementById("sdob-error");
            sdobError.innerHTML = "";
            
            var sgenderError = document.getElementById("sgender-error");
            sgenderError.innerHTML = "";
            
            var sfathernameError = document.getElementById("sfathername-error");
            sfathernameError.innerHTML = "";
            
            var smothernameError = document.getElementById("smothername-error");
            smothernameError.innerHTML = "";
            
            var saddressError = document.getElementById("saddress-error");
            saddressError.innerHTML = "";
            
            if (!sid) {
                sidError.innerHTML = "Student ID is required.";
                return false;
            }
            
            var lettersPattern = /^[A-Za-z\s]+$/;

            
            if (!sname) {
                snameError.innerHTML = "Name is required.";
                return false;
            } else if (!lettersPattern.test(sname)) {
                snameError.innerHTML = "Name should contain only alphabets and spaces.";
                return false;
            } else if (sname.length <= 5) {
                snameError.innerHTML = "Name should be at least 6 characters long.";
                return false;
            }
            
            if (!smail) {
                smailError.innerHTML = "Email is required.";
                return false;
            }
            
            if (!spassword) {
                spasswordError.innerHTML = "Password is required.";
                return false;
            } else if (!validatePassword(spassword)) {
                spasswordError.innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one number, one symbol, and be at least 4 characters long.";
                return false;
            }
            
            if (!sphoneno) {
                sphonenoError.innerHTML = "Phone Number is required.";
                return false;
            } else if (!validatePhoneNumber(sphoneno)) {
                sphonenoError.innerHTML = "Phone Number must be a 10-digit number.";
                return false;
            }
            
            if (!sdob) {
                sdobError.innerHTML = "Date of Birth is required.";
                return false;
            }
            
            if (!sgender) {
                sgenderError.innerHTML = "Gender is required.";
                return false;
            }
            
            if (!sfathername) {
                sfathernameError.innerHTML = "Father's Name is required.";
                return false;
            } else if (!lettersPattern.test(sfathername)) {
                sfathernameError.innerHTML = "Father's Name should contain only alphabets and spaces.";
                return false;
            } else if (sfathername.length <= 5) {
                sfathernameError.innerHTML = "Father's Name should be at least 6 characters long.";
                return false;
            }
            
            // ...
            
            if (!smothername) {
                smothernameError.innerHTML = "Mother's Name is required.";
                return false;
            } else if (!lettersPattern.test(smothername)) {
                smothernameError.innerHTML = "Mother's Name should contain only alphabets and spaces.";
                return false;
            } else if (smothername.length <= 5) {
                smothernameError.innerHTML = "Mother's Name should be at least 6 characters long.";
                return false;
            }
            
            if (!saddress) {
                saddressError.innerHTML = "Address is required.";
                return false;
            } else if (saddress.length <= 15) {
                saddressError.innerHTML = "Address must be at least 15 characters long.";
                return false;
            }
            
            return true;
        }
        
        function validatePassword(password) {
            var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;
            return pattern.test(password);
        }
        
        function validatePhoneNumber(phoneNumber) {
            var pattern = /^\d{10}$/;
            return pattern.test(phoneNumber);
        }
        
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>