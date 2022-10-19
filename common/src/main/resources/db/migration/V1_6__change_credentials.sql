alter table rentcar.credentials
    add user_id bigint;

alter table rentcar.credentials
drop constraint credential_users_id_fk;

alter table rentcar.credentials
    add constraint credential_users_id_fk
        foreign key (user_id) references rentcar.users
            on update cascade on delete cascade;

