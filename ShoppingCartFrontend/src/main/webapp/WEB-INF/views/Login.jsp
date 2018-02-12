<%@include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/basicStyles.css">
</head>
<body>
	<div class="container">    
        <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div class="toFloat"><a href="#">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body">
                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>                            
                        <form id="loginform" class="form-horizontal" role="form">                                    
                            <div style="margin-bottom: 25px" class="input-group">
                            	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username or email">                                        
                           	</div>    
                            <div style="margin-bottom: 25px" class="input-group">
                            	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="password" placeholder="password">
                            </div>   
                            <div class="input-group">
                            	<div class="checkbox">
                                	<label>
                                    	<input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                 	</label>
                               	</div>
                            </div>

                            <div style="margin-top:10px" class="form-group">
                           		<div class="col-sm-12 controls">
                                	<a id="btn-login" href="#" class="btn btn-success">Login</a>                            
                                </div>
                           	</div>
                           	
                           	<div class="form-group">
                            	<div class="col-md-12 control">
                                	<div style="border-top: 1px solid#4cae4c; padding-top:15px;" >
                                    	Don't have an account?
                                        <a href="register">&nbsp;Sign Up Here</a>
                                    </div>
                                </div>
                            </div>    
               			</form>
               		</div>                     
            </div>  
        </div>
    </div>
</body>
</html>