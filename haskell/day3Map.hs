import qualified Data.Map as Map

fruitsMap = Map.fromList [("apple", 2), ("banana", 3), ("cherry", 5), ("durian", 7), ("elderberry", 11), ("fig", 13)]

lookupList _ [] = Nothing
lookupList k ((k',v):t) =
    if k' == k
    then Just v
    else lookupList k t

lookupMap k m = lookupList k $ Map.toList m

departmentHierarchy =
    Map.fromList [
        ("Finance", Map.fromList [
            ("Accounting", Map.fromList [
                ("General Ledger", 1),
                ("Accounts Payable", 2),
                ("Accounts Receivable", 3)
            ]),
            ("Budgeting", Map.fromList [
                ("Financial Planning", 4),
                ("Forecasting", 5)
            ]),
            ("Payroll", Map.fromList [
                ("Compensation", 6),
                ("Benefits", 7)
            ])
        ]),
        ("Marketing", Map.fromList [
            ("Advertising", Map.fromList [
                ("Creative", 8),
                ("Media Buying", 9)
            ]),
            ("Brand Management", Map.fromList [
                ("Product Marketing", 10),
                ("Corporate Communications", 11)
            ]),
            ("Market Research", Map.fromList [
                ("Consumer Insights", 12),
                ("Competitive Analysis", 13)
            ])
        ]),
        ("Operations", Map.fromList [
            ("Manufacturing", Map.fromList [
                ("Production", 14),
                ("Quality Assurance", 15)
            ]),
            ("Supply Chain", Map.fromList [
                ("Procurement", 16),
                ("Inventory Management", 17)
            ]),
            ("Logistics", Map.fromList [
                ("Transportation", 18),
                ("Distribution", 19)
            ])
        ]),
        ("Human Resources", Map.fromList [
            ("Recruitment", Map.fromList [
                ("Talent Acquisition", 20),
                ("Onboarding", 21)
            ]),
            ("Training", Map.fromList [
                ("Professional Development", 22),
                ("Leadership Development", 23)
            ]),
            ("Employee Relations", Map.fromList [
                ("Compliance", 24),
                ("Employee Engagement", 25)
            ])
        ]),
        ("Information Technology", Map.fromList [
            ("Infrastructure", Map.fromList [
                ("Network Administration", 26),
                ("Systems Administration", 27)
            ]),
            ("Software Development", Map.fromList [
                ("Web Development", 28),
                ("Application Development", 29)
            ]),
            ("IT Support", Map.fromList [
                ("Helpdesk", 30),
                ("Technical Support", 31)
            ])
        ])
    ]

webDevNumber = do
    it <- lookupMap "Information Technology" departmentHierarchy
    software <- lookupMap "Software Development" it
    webDev <- lookupMap "Web Development" software
    return webDev
