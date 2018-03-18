
    function setValue(ident)
    {
      $("."+ident).text($("#"+ident).val());    
    }
    
 function ChooseStyle()
    {
        dialog("选择风格","id:showfloat","840px","auto","id");
    }
    
    
    function btnOK()
    {
      var v = $(':radio:checked').val();
     //var v = $('input[@name=styleId][@checked]').val();
     if(v>0)
     {
     $("#styleId").val(v);
      for(i=1;i<16;i++)
      {
        if(i==v)
          $("#c"+i).show();
        else
          $("#c"+i).hide();
      }
      }

    $("#floatBoxBg").animate({opacity:"0"},"normal",function(){$(this).hide();});
    $("#floatBox").hide();
    }
