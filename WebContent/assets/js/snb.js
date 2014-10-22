// JavaScript Document
function snb(el)
{
	var $snbBox      = $(el);
	var $sub_dep1    = $snbBox.find(".dep1>a");
	var $sub_dep2    = $snbBox.find(".dep2>ul");
	var $active      = $snbBox.find("dt.active");
	var $active_dep1 = $active.find("a");
	var $active_dep2 = $active.next().find("ul");
	var $dep2_active = $active_dep2.find(".active>a");
	
	$dep2_active.css("color","#e11837");
	
	$sub_dep2.css("display","none");
	
	$active_dep2.css("display","block");
	
	$active_dep1.find("img").attr("src",function()
	{
		return $(this).attr("src").replace(".gif","_on.gif");	
	});
	
	$sub_dep1.parent().last().css("border","none");
	
	$snbBox.bind("mouseleave",function()
	{
		$sub_dep1.each(function(i)
		{
			if( $active_dep1.parent().index() != $(this).parent().index() )
			{
				$(this).parent().next().find("ul").stop();
				$(this).parent().next().find("ul").slideUp(300);	
			}
		});
	});
	
	$sub_dep1.bind("mouseenter",function()
	{	
		if( $active_dep1.parent().index() != $(this).parent().index() )
		{
			$(this).find("img").attr("src",function()
			{
				return $(this).attr("src").replace(".gif","_over.gif");	
			});
			
			var $this = $(this);
					
			$sub_dep1.each(function(i)
			{
				if( $this.parent().index() == $(this).parent().index() )
				{
					$(this).parent().next().find("ul").stop();
					$(this).parent().next().find("ul").slideDown(300);	
				}
				else
				{
					if( $active_dep1.parent().index() != $(this).parent().index() )
					{
						$(this).parent().next().find("ul").stop();
						$(this).parent().next().find("ul").slideUp(300);		
					}
				}
			});
		}			
	});
	
	$sub_dep1.bind("mouseleave",function()
	{
		if( $active_dep1.parent().index() != $(this).parent().index() )
		{
			$(this).find("img").attr("src",function()
			{
				return $(this).attr("src").replace("_over.gif",".gif")	;
			});
		}
	});

	function fn_over(over_sub) 
	{
		$sub_dep1.each(function(index) 
		{
			if( $sub_dep1.eq(index).parent().index() == over_sub ) 
			{
				$(this).parent().next().find("ul").slideDown(300);
				$active = $(this).parent();
			} 
			else 
			{
				$sub_dep2.each(function(i) 
				{
					if( $(this) != $active_dep2 ) 
					{
						$(this).stop();
						$(this).slideUp(300);
					}
				});
			}
		});
	}	
}
	
	
///////////////////////// 경고 메시지 ///////////////////////////////////
function msg(str)
{
	alert(str);	
}
