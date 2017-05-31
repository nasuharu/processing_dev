

import java.awt.Toolkit;
import java.time.Instant;
import java.util.Random;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import javafx.scene.paint.Paint;



public class Marubatsu extends Application {

    Canvas canvas = new Canvas(200, 185);
    GraphicsContext gc = null;

    int data[]= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int nSente = 0;
    int nTe = 0;


    int toWin [][] = {{0, 4, 8}, {2, 6, 4},
            {0, 1, 2}, {3, 4, 5}, {6, 7, 8},
            {0, 3, 6}, {1, 4, 7}, {2, 5, 8}};

    Label statusLabel = new Label("");

    @Override
    public void start(Stage stage) throws Exception {

        stage.setTitle("Marubatsu");
        stage.initStyle(StageStyle.UTILITY);
        stage.centerOnScreen();
        stage.setResizable(false);


        MenuBar menuBar = new MenuBar();
        menuBar.setUseSystemMenuBar(true);
        Menu fileMenu = new Menu("file");
        menuBar.getMenus().add(fileMenu);
        MenuItem mnuSente = new MenuItem("first");
        mnuSente.setOnAction(event -> {
            nSente = 2;
            statusLabel.setText("");
            });
        MenuItem mnuGote = new MenuItem("second");
        mnuGote.setOnAction(event -> {
            nSente = 1;
            statusLabel.setText("");
            compute();
            });
        MenuItem mnuExit = new MenuItem("end");
        mnuExit.setOnAction(event -> Platform.exit());

        fileMenu.getItems().addAll(mnuSente, mnuGote, mnuExit);

        gc = canvas.getGraphicsContext2D();
        drawMasu();
        canvas.setMouseTransparent(false);
        canvas.setOnMouseClicked(event -> {
            if (nSente == 0)
                return;
            int x = (int) (event.getSceneX() - canvas.getLayoutX());
            int y = (int) (event.getSceneY() - canvas.getLayoutY());
            int pos = point2pos(x, y);
            statusLabel.setText(String.format("(%d,%d)", pos % 3, pos / 3));
            if (pos > 8)
                Toolkit.getDefaultToolkit().beep();
            else
                drawMaruOrBatu(pos);

            Platform.runLater(new Runnable() {
                @Override
                public void run() {
                    compute() ;
                }
            });
        });

        initGame();


        BorderPane root = new BorderPane();
        root.setTop(menuBar);
        root.setCenter(canvas);
        root.setBottom(statusLabel);

        stage.setScene(new Scene(root, 220, 230));
        stage.show();
    }

    void drawMasu()
    {
        gc.clearRect(0,  0,  285,  285);
        gc.save();
        gc.setLineWidth(4.0);
        gc.strokeLine(40, 40, 160, 40);
        gc.strokeLine(40, 80, 160, 80);
        gc.strokeLine(40, 120, 160, 120);
        gc.strokeLine(40, 160, 160, 160);
        gc.strokeLine(40, 40, 40, 160);
        gc.strokeLine(80, 40, 80, 160);
        gc.strokeLine(120, 40, 120, 160);
        gc.strokeLine(160, 40, 160, 160);
        gc.restore();
        gc.setLineWidth(3.0);
    }



    void  compute() {

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isGameEnd())
            return;


        int weight[] = {0,0,0,0,0,0,0,0,0};

        Random rnd = new Random( Instant.now().getNano());

        for (int i=0; i<9; i++)
            if (data[i] != 0)
                weight[i] = -99;

        if (nTe ==0) {
            int proposed[] = {0, 2, 4, 6, 7};
            weight[proposed[rnd.nextInt(5)]] = 99;
        }

        if (nTe == 1) {
            int proposed[] = {0, 2, 4, 6, 7};
            for (int i=0; i<5;i++)
            {
                int p = proposed[rnd.nextInt(5)];
                if (weight[p] != -99) {
                    weight[p] = 99;
                    break;
                }
            }
        }


        int count = 0;
        boolean fDone = false;
        for (int i=0; i<8; i++) {
            count = 0;
            for (int j=0; j<3; j++) {
               if (data[ toWin [i][j] ] == 1)
                   count += 1;
            }
            for (int k=0; k<3; k++){
                if (count == 2 && data[ toWin [i][k] ] == 0){
                    weight[toWin [i][k]] = 99;
                    fDone = true;
                    break;
                }
            }
            if (fDone == true)
                break;
        }


        int pos = 99;
        int maxWeight = -99;
        for (int i=0; i<9; i++)
        {
            if (weight[i] > maxWeight)
            {
                maxWeight = weight[i];
                pos = i;
            }
        }

        drawMaruOrBatu(pos);
        isGameEnd();
    }

    boolean isGameEnd() {
        if (nTe < 5)
            return false;

        String msg = "GameOver draw";

        int iWin = 0;
        for (int i=1; i<3;i++) {
            if (data[0] == i && data[4] == i && data[8] == i)
                iWin = i;
            if (data[2] == i && data[4] == i && data[6] == i)
                iWin = i;
        }
        for (int i=0; i<3;i++) {
            for (int j=1; j<3; j++) {
                if (data[0+3*i] == j && data[1+3*i] == j && data[2+3*i] == j) {
                    iWin = j;
                    break;
                }
            }
            if (iWin > 0)
                break;
        }
        for (int i=0; i<3;i++) {
            for (int j=1; j<3; j++) {
                if (data[i%3] == j && data[i%3+3] == j && data[i%3+6] == j) {
                    iWin = j;
                    break;
                }
            }
            if (iWin > 0)
                break;
        }

        if (iWin == 0 && nTe < 9)
            return false;

        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (iWin == 1){
            msg = "GameOver com win";
        }
        if (iWin == 2){
            msg = "GameOver you win";
        }

        Alert dlg = new Alert(AlertType.INFORMATION);
        dlg.setTitle("GameOver");
        dlg.setHeaderText(String.format(msg));
        dlg.showAndWait();
        initGame();
        return true;
    }

    void initGame() {


        for (int i=0; i<9; i++)
            data[i]= 0;
        nTe = 0;
        nSente = 0;
        drawMasu();
        statusLabel.setText("[first]/[second]choose one");
    }


    int point2pos(int x, int y){
        int cx = 99, cy = 99;
        if (x > 40 && x <= 80)
            cx = 0;
        if (x > 80 && x <= 120)
            cx = 1;
        if (x > 120 && x <= 160)
            cx = 2;
        if (y > 40 && y <= 80)
            cy = 0;
        if (y > 80 && y <= 120)
            cy = 1;
        if (y > 120 && y <= 160)
            cy = 2;
        return (cx + 3 * cy);
    }

    void drawMaruOrBatu(int pos) {

        int cx = 60 + (pos % 3) * 40;
        int cy = 60 + (pos / 3) * 40;



        if (nSente == 1)  {
            if (nTe %2 == 0) {

                //gc.getstroke(Color.BLUE);
                gc.strokeOval(cx - 10,  cy - 10,  20, 20);
                data[pos] = 1;
            } else {
                data[pos] = 2;
                gc.strokeLine(cx - 10,  cy - 10,  cx + 10,  cy + 10);
                gc.strokeLine(cx - 10,  cy + 10,  cx + 10,  cy - 10);
            }
        } else if (nSente == 2) {
            if (nTe %2 == 0) {
                data[pos] = 2;
                //gc.getstroke(Color.RED);
                gc.strokeOval(cx - 10,  cy - 10,  20, 20);
            } else {
                data[pos] = 1;
                gc.strokeLine(cx - 10,  cy - 10,  cx + 10,  cy + 10);
                gc.strokeLine(cx - 10,  cy + 10,  cx + 10,  cy - 10);
            }
        }
        nTe += 1;
    }
}
