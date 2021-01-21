package desktop.fragments;

import abstractClasses.fragment.AbstractFragment;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ExampleFragment extends AbstractFragment {

    private static final By PRODUCT_NAME = By.cssSelector("locator here");

    @FindBy(xpath = "put your locator expression here")
    private WebElement fragmentRootElement;

    public ExampleFragment() {
        setRootElement(fragmentRootElement);
    }

    public void clickProductName() {
        clickElement(PRODUCT_NAME);
    }
}
