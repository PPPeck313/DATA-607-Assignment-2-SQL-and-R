# Assignment – SQL and R
Choose six recent popular movies. Ask at least five people that you know (friends, family, classmates, imaginary friends if necessary) to rate each of these movies that they have seen on a scale of 1 to 5. Take the results (observations) and store them in a SQL database of your choosing. Load the information from the SQL database into an R dataframe.

This is by design a very open-ended assignment. In general, there’s no need here to ask “Can I...?” questions about your proposed approach. A variety of reasonable approaches are acceptable. You could for example access the SQL data directly from R, or you could create an intermediate .CSV file. I should be able to generate the SQL table(s) and data from your provided code—if you use a graphical user interface to create and populate tables, it should have a mechanism to generate corresponding SQL code.

This assignment does not need to be 100% reproducible. You can (and should) blank out your SQL password if your solution requires it; otherwise, full credit requires that your code is “reproducible,” with the assumption that I have the same database server and R software.

Handling missing data is a foundational skill when working with SQL or R. To receive full credit, you should demonstrate a reasonable approach for handling missing data. After all, how likely is it that all five of your friends have seen all six movies?

You’re encouraged to optionally find other ways to make your solution better. For example, consider incorporating one or more of the following suggestions into your solution:

- Use survey software to gather the information.
- Are you able to use a password without having to share the password with people who are viewing yourcode? There are a lot of interesting approaches that you can uncover with a little bit of research.
- While it’s acceptable to create a single SQL table, can you create a normalized set of tables thatcorresponds to the relationship between your movie viewing friends and the movies being rated?
- Is there any benefit in standardizing ratings? How might you approach this?
