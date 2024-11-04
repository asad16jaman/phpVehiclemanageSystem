<fieldset>
    <!-- Form Name -->
    <legend>Change Password</legend>
    <!-- Old password-->
    <div class="form-group">
        <label class="col-md-4 control-label">Current Password</label>
        <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input  type="password" name="current" autocomplete="off" placeholder="current password" class="form-control" value="">
            </div>
        </div>
    </div>
    <!--New password-->
    <div class="form-group">
        <label class="col-md-4 control-label" >New Password</label>
        <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" name="password" autocomplete="off" placeholder="new password " class="form-control" required="" autocomplete="off">
            </div>
        </div>
    </div>
    <!-- Confirm New Password -->
    <div class="form-group">
        <label class="col-md-4 control-label" >New Password</label>
        <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" name="c_password" autocomplete="off" placeholder="confirm password " class="form-control" required="" autocomplete="off">
            </div>
        </div>
    </div>
    
    <!-- Button -->
    <div class="form-group">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
            <button type="submit" class="btn btn-warning" >Save <span class="glyphicon glyphicon-send"></span></button>
            <a href="profile.php"  class="btn btn-primary" >Cancle</a>
        </div>
    </div>
</fieldset>