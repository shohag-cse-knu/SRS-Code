//Call Info All
$(document).ready(function () {
    //To set caller Info
    //Call Info All
    $("#all .call-info").click(function () {
                $('#call-all').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#call-all').html(code);
                $("#call-all").show();
            }            
    );
    //Call Info Incoming
    $("#incoming .call-info").click(function () {
                $('#call-incoming').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#call-incoming').html(code);
                $("#call-incoming").show();
            }            
    );
    //Call Info Outgoing
    $("#outgoing .call-info").click(function () {
                $('#call-outgoing').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#call-outgoing').html(code);
                $("#call-outgoing").show();
            }            
    );
    //Call Info Missed
    $("#missed .call-info").click(function () {
                $('#call-missed').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#call-missed').html(code);
                $("#call-missed").show();
            }            
    );
    //To set Message Info
    //Inbox
    $("#inbox .call-info").click(function () {
                $('#sms-inbox').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable margin_left"><h4>Today</h4><div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample.dsgsdgssdg dsgsdg sdgsd</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div></div>');
                $('#sms-inbox').html(code);
                $("#sms-inbox").show();
            }            
    );
    //Sent
    $("#sent .call-info").click(function () {
                $('#sms-sent').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable margin_left"><h4>Today</h4><div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample.dsgsdgssdg dsgsdg sdgsd</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_right"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div> <div class="row message_box_left"><span class="message">This is sample</span><span>10:30PM</span></div><div class="margin-top-2"></div></div>');
                $('#sms-sent').html(code);
                $("#sms-sent").show();
            }            
    );
    //Draft
    $("#draft .call-info").click(function () {
                $('#sms-draft').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#sms-draft').html(code);
                $("#sms-draft").show();
            }            
    );
    //Outbox
    $("#outbox .call-info").click(function () {
                $('#sms-outbox').remove('detail');
                var code =$('<div id="detail" class="row"><div class="col-sm-5"><i class="fa fa-user fa-5x" aria-hidden="true" ></i></div><div class="col-sm-7"><h3>Alex Vidal</h3><span>01676332242</span></div></div><div class="row"><ul class="nav navbar-nav"><li class="active"><a href="#">Call</a></li><li><a href="#">SMS</a></li></ul></div><div class="margin-top-2"></div><div class="row scrollable"><div class="row"><div class="col-sm-4"><div class="margin_left image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div><div class="margin-top-2"></div><div class="row"><div class="col-sm-4"><div class="image-center"><i class="fa fa-arrow-left fa-2x" aria-hidden="true" ></i></div></div><div class="col-sm-4"><h4>Today</h4></div><div class="col-sm-4"><h4 class="font_size">10:30PM</h4></div></div>  </div>');
                $('#sms-outbox').html(code);
                $("#sms-outbox").show();
            }            
    );
      //To set the url dynamically
        jquery('#click_sms').live('click', function($){
          if($(this).hasClass('active')) {

          } else {
              history.pushState(null, null, curLoc);
          }
              return false;
    });
});