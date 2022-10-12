CREATE TABLE "accounts" (
                            "id" bigserial PRIMARY KEY NOT NULL,
                            "username" varchar NOT NULL,
                            "owner" varchar NOT NULL,
                            "balance" float4 NOT NULL,
                            "currency" varchar NOT NULL,
                            "merchant_name" varchar NOT NULL,
                            "created_at" timestamp NOT NULL DEFAULT (now()),
                            "updated_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
                           "id" bigserial PRIMARY KEY NOT NULL,
                           "account_id" bigint NOT NULL,
                           "amount" float4 NOT NULL,
                           "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
                             "id" bigserial PRIMARY KEY NOT NULL,
                             "from_account_id" bigint NOT NULL,
                             "to_account_id" bigint NOT NULL,
                             "amount" float4 NOT NULL,
                             "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE INDEX ON "accounts" ("username");

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");