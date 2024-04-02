drop table message purge;
drop table chat purge;
drop table faqBoard purge;
drop table eventBoard purge;
drop table usercoupon purge;
drop table coupon purge;
drop table storageItem purge;
drop table orderDetail purge;
drop table orders purge;
drop table storeLike purge;
drop table storeReview purge;
drop table productLike purge;
drop table cart purge;
drop table productReview purge;
drop table inventory purge;
drop table manager purge;
drop table store purge;
drop table product purge;
drop table category purge;
drop table myLocation purge;
drop table member purge;

create table member (
    idx         number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid      varchar2(500)   unique not null,
    userpw      varchar2(500)   not null,
    email       varchar2(500)   not null,
    nickname    varchar2(500)   unique not null,
    pnum        varchar2(500)    not null,
    role        number          check(role between 1 and 3) not null,
    naver_id    varchar2(500)
    -- role 1: 전체관리자, 2: 점주, 3: 일반회원
);

create table myLocation(
    idx         number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     
    member_idx  number          not null,
    address     varchar2(2000)  not null,
    lat         varchar2(1000)  not null, 
    lng         varchar2(1000)  not null, 
    
    constraint myLocation_member_fk
    foreign key (member_idx)
    references member(idx) on delete cascade
);

create table category (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoryName    varchar2(500)   unique not null
);

create table product(
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_idx    number          not null,
    name            varchar2(500)   not null,
    price           number          check(price > 0) not null,
    content         varchar2(4000)  default '-',
    image           varchar2(1000)  not null,
    event           varchar2(100)   default '행사없음', -- 행사 있는경우 '+'를 넣어서 기입
    
    constraint product_category_fk
    foreign key (category_idx)
    references category(idx) on delete cascade
);

create table store (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            varchar2(500)   not null,
    address         varchar2(2000)  not null,
    pnum            varchar2(100)   ,           -- 지점 연락처는 null값 허용
    lat             varchar2(1000)  not null,   -- 위도
    lng             varchar2(1000)  not null    -- 경도
);

create table manager (
    idx         number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid      varchar2(500)    not null,
    name        varchar2(500)    not null,
    store_idx   number          not null,
    status      number          default 0 check(status in (0, 1)),
    -- 기본 '0' , 전체관리자가 확인하면 '1' -> 확인시 member의 role이 3에서 2로 바뀜
    
    constraint manager_member_fk
    foreign key (userid)
    references member(userid) on delete cascade,
    
    constraint manager_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade
);

create table inventory (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_idx     number          not null,
    store_idx       number          not null,
    cnt             number          default 0 check(cnt >= 0) not null,
    
    constraint inventory_product_fk
    foreign key (product_idx)
    references product(idx) on delete cascade,
    
    constraint inventory_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade
);

create table productReview (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_idx     number          not null,
    userid          varchar2(500)   not null,
    score           number          check (score between 0 and 5),
    content         varchar2(4000)  not null,
    reviewDate      date            default sysdate,
    
    constraint productReview_product_fk
    foreign key (product_idx)
    references product(idx) on delete cascade,
    
    constraint productReview_member_fk
    foreign key (userid)
    references member(userid) on delete cascade
); 

create table cart (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid          varchar2(500)   not null,
    product_idx     number          not null,
    store_idx       number          not null,
    cnt             number          check(cnt >= 1) not null,
    eventcnt        number          default 0,
    
    constraint cart_member_fk
    foreign key (userid)
    references member(userid) on delete cascade,
    
    constraint cart_product_fk
    foreign key (product_idx)
    references product(idx) on delete cascade,
    
    constraint cart_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade
);

create table productLike (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid          varchar2(500)   not null,
    product_idx     number          not null,
    
    constraint productLike_member_fk
    foreign key (userid)
    references member(userid) on delete cascade,
    
    constraint productLike_product_fk
    foreign key (product_idx)
    references product(idx) on delete cascade
);

create table storeReview (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    store_idx       number          not null,
    userid          varchar2(500)   not null,
    score           number          check (score between 0 and 5),
    content         varchar2(4000)  not null,
    reviewDate      date            default sysdate,
    
    constraint storeReview_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade,
    
    constraint storeReview_member_fk
    foreign key (userid)
    references member(userid) on delete cascade
);

create table storeLike (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid          varchar2(500)   not null,
    store_idx       number          not null,
    
    constraint storeLike_member_fk
    foreign key (userid)
    references member(userid) on delete cascade,
    
    constraint storeLike_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade
);

create table orders (
    idx             varchar2(300)   not null primary key,   -- 결제 id 넣을 예정
    userid          varchar2(500)   not null,
    store_idx       number          not null,
    pickupcode      varchar2(100)   not null,
    status          number          default 0 check (status between 0 and 1), -- 0 픽업전, 1 픽업완료
    orderDate       date            default sysdate,
    pickuptime      date            default sysdate,
    paymentkey      varchar2(300)   not null,
    amount          number          not null,
    
    constraint orders_member_fk
    foreign key (userid)
    references member(userid) on delete cascade,
    
    constraint orders_store_fk
    foreign key (store_idx)
    references store(idx) on delete cascade
);

create table orderDetail (
    idx             varchar2(100)   not null primary key,
    orders_idx      varchar2(300)   not null,
    product_idx     number          not null,
    cnt             number          check(cnt >0) not null,
    price           number          check(price >= 0) not null,
    
    constraint orderDetail_orders_fk
    foreign key (orders_idx)
    references orders(idx) on delete cascade,
    
    constraint orderDetail_product_fk
    foreign key (product_idx)
    references product(idx) on delete cascade
);

create table storageItem (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orderDetail_idx varchar2(100)   not null,
    userid          varchar2(500)   not null,
    totalCount      number          not null check(totalCount >0),
    resCount        number          not null check(resCount >=0),
    status          number          default 0 check(status between 0 and 1), -- 0:진행중, 1:픽업모두 완료
    
    constraint storageItem_orderDetail_fk
    foreign key (orderDetail_idx)
    references orderDetail(idx) on delete cascade,
    
    constraint storageItem_member_fk
    foreign key (userid)
    references member(userid) on delete cascade
);


create table coupon (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title           varchar2(1000)  not null,   
    discValue       varchar2(100)   not null,	
    valid           number          not null
);


create table usercoupon (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    coupon_idx      number          not null,
    userid          varchar2(500)   not null,
    issueDate       date            default sysdate,    -- 발행일자
    endDate         date            not null,           -- 만료일자
    usedDate        date            ,                   -- 사용날짜
    
    constraint usercoupon_coupon_fk
    foreign key (coupon_idx)
    references coupon(idx) on delete cascade,
    
    constraint usercoupon_member_fk
    foreign key (userid)
    references member(userid) on delete cascade
);

create table eventBoard (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    coupon_idx	    number	        not null,
    writer          varchar2(500)   not null,
    title           varchar2(1000)  not null,
    image           varchar2(1000)  ,
    writeDate       date            default sysdate,
    endDate         date            not null,

    constraint eventBoard_coupon_fk
    foreign key (coupon_idx)
    references coupon(idx) on delete cascade,
    
    constraint eventBoard_member_fk
    foreign key (writer)
    references member(userid) on delete cascade
);

create table faqBoard (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title           varchar2(1000)  not null,
    answer          varchar2(4000)  not null,
    
    constraint faqBoard_member_fk
    foreign key (writer)
    references member(userid) on delete cascade
);

create table chat (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    userid1         varchar2(500)   not null,
    userid2         varchar2(500)   default 'admin',
    chatDate        date            default sysdate,
    status          number          default 0 check(status between 0 and 1),  -- 0: 채팅진행중, 1: 채팅완료
    
    constraint chat_member_fk1
    foreign key (userid1)
    references member(userid) on delete cascade,
    
    constraint chat_member_fk2
    foreign key (userid2)
    references member(userid) on delete cascade
);

create table message (
    idx             number          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    chat_idx        number          not null,
    content         varchar2(2000)  not null,
    writer          varchar2(500)   not null,
    messageDate     date            default sysdate,
    
    constraint message_chat_fk
    foreign key (chat_idx)
    references chat(idx) on delete cascade,
    
    constraint message_member_fk
    foreign key (writer)
    references member(userid) on delete cascade
);