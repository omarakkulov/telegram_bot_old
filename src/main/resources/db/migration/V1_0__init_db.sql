CREATE TABLE IF NOT EXISTS TELEGRAM_USER
(
    ID       BIGSERIAL PRIMARY KEY,
    CHAT_ID  BIGINT       NOT NULL UNIQUE,
    USERNAME VARCHAR(255) NULL
);
COMMENT ON TABLE TELEGRAM_USER IS 'Информация о пользователе, взаимодействующего с ботом';
COMMENT ON COLUMN TELEGRAM_USER.ID IS 'Id записи';
COMMENT ON COLUMN TELEGRAM_USER.CHAT_ID IS 'Id чата пользователя, прикрепленного к боту';
COMMENT ON COLUMN TELEGRAM_USER.USERNAME IS 'Логин пользователя (может быть пустым)';

CREATE TABLE IF NOT EXISTS TELEGRAM_USER_MESSAGE
(
    ID               BIGSERIAL PRIMARY KEY,
    MSG_DATA         TEXT                                                                       NOT NULL,
    TELEGRAM_USER_ID BIGINT REFERENCES TELEGRAM_USER (ID) ON DELETE SET NULL ON UPDATE RESTRICT NOT NULL
);
COMMENT ON TABLE TELEGRAM_USER_MESSAGE IS 'Данные, пришедшие от пользователя в сообщении';
COMMENT ON COLUMN TELEGRAM_USER_MESSAGE.ID IS 'Id записи';
COMMENT ON COLUMN TELEGRAM_USER_MESSAGE.MSG_DATA IS 'Текст сообщения от пользователя';
COMMENT ON COLUMN TELEGRAM_USER_MESSAGE.TELEGRAM_USER_ID IS 'Id записи из TELEGRAM_USER таблицы';