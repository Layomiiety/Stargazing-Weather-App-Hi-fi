import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class WeatherApp extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {
        // Create the components
        Label label = new Label("Enter the name of a city:");
        TextField textField = new TextField();
        Button button = new Button("Get weather");

        // Add event handler for button click
        button.setOnAction(event -> {
            String cityName = textField.getText();
            // TODO: fetch weather data and update UI
        });

        // Layout the components
        VBox root = new VBox(label, textField, button);

        // Set the scene and show the stage
        Scene scene = new Scene(root);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}