#include <iostream>
#include <cmath>
using namespace std;

void naiveGaussElimination(double matrix[3][4], double coefficients[3]) {   //gaussian elimination function
    
    for (int i = 0; i < 3; i++) {
        for (int j = i + 1; j < 3; j++) {
            double factor = matrix[j][i] / matrix[i][i];
            for (int k = i; k < 4; k++) {
                matrix[j][k] -= factor * matrix[i][k];
            }
        }
    }

    for (int i = 2; i >= 0; i--) {      // calculating the coefficients 
        coefficients[i] = matrix[i][3];
        for (int j = i + 1; j < 3; j++) {
            coefficients[i] -= matrix[i][j] * coefficients[j];
        }
        coefficients[i] /= matrix[i][i];
    }
}


double Velocity(double a1, double a2, double a3, double t) {  // function to calculate the Velocity
    return a1 * pow(t, 2) + a2 * t + a3;
}

int main() {
    double matrix[3][4] = {
        {25, 5, 1, 106.8},
        {64, 8, 1, 177.2},
        {144, 12, 1, 279.2}
    };

    double coefficients[3];

    naiveGaussElimination(matrix, coefficients);

    double a1 = coefficients[0];
    double a2 = coefficients[1];
    double a3 = coefficients[2];

    cout << "Coefficients: a1 = " << a1  <<", a2 = " << a2  << ", a3 = " << a3 << endl;

    // the velocity at t = 6 seconds
    double t = 6;
    double velocity = Velocity(a1, a2, a3, t);
    cout << "Velocity at t = 6 seconds: " << velocity << " m/s" << endl;

    return 0;
}
