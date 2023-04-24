delimiter $$
create trigger update_rating

Before insert on reseres
for each row
begin
call update_rate(new.sid);
end $$
delimiter ;
