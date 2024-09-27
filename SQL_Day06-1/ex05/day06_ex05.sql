COMMENT ON TABLE person_discounts IS 'Таблица, которая считает персональную скидку клиентов';
COMMENT ON COLUMN person_discounts.id IS 'ID скидок';
COMMENT ON COLUMN person_discounts.person_id IS 'ID человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка, которая расчитывается для каждого человека';