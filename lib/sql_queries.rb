# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"SELECT title, SUM(pledges.amount)
FROM projects
INNER JOIN pledges
ON projects.id = pledges.project_id
GROUP BY(title)"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"SELECT name, age, SUM(pledges.amount)
FROM users
INNER JOIN pledges
ON users.id = pledges.user_id
GROUP BY (name)"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT title, SUM(pledges.amount) - funding_goal
FROM projects
INNER JOIN pledges
ON projects.id = pledges.project_id
GROUP BY (title)
HAVING (SUM(pledges.amount) - funding_goal) >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"SELECT name, SUM(pledges.amount)
FROM users
INNER JOIN pledges
ON users.id = pledges.user_id
GROUP BY name
ORDER BY SUM(pledges.amount), name"
end
## there are certain entries that aren't there in the expected ? why?

## JOIN projects ON pledges.pledge_id = projects.id

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT category, pledges.amount
FROM projects
INNER JOIN pledges
ON projects.id = pledges.project_id
WHERE category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT category, SUM(pledges.amount)
FROM projects
INNER JOIN pledges
ON projects.id = pledges.project_id
GROUP BY category
HAVING category = 'books'"
end
