alter table rentcar.cars
    add creation_date timestamp(6) default current_timestamp(6);

alter table rentcar.cars
    add modification_date timestamp(6) default current_timestamp(6);