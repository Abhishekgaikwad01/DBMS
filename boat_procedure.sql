delimiter $$
create procedure update_rate(IN A int)
Begin
update sailor set srating=srating+1 where sid =A;

End $$
delimiter ;
