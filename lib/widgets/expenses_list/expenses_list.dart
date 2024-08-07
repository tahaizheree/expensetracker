import 'package:expensetracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: Theme.of(context).cardTheme.margin,
              ),
              onDismissed: (direction) {
                removeExpense(expenses[index]);
              },
              child: ExpenseItem(expenses[index]),
            ));
  }
}
