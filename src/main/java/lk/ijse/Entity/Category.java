package lk.ijse.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:43 AM
 * Description:
 */
@Entity
@Table(name = "categories")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;

    private String name;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Product> products = new ArrayList<>();

    // Getters and setters
}

/*  image path = #3 - LIFTING THE BONNET ON YOMP-ENGINE No1 - GORUCK GR2 VARIANT (Repost BPD).jpeg
*   image path = 5e5dc785-161e-42c4-807f-71e77b5d64ce.jpeg
*   image path = 36 Extremely Useful Products On Amazon That Could Save Your Life During An Apocalypse.jpeg
*   image path = 60 In 1 Multifunction Survival Kit Outdoor Emergency Camping Military Defense Equipment First Aid SOS for Wilderness Adventure - Black.jpeg
*   image path = Does A Machete Make A Good Survival Tool_.jpeg
*   image path = Doomsday Survivor Essentials_ The Ultimate Guide to Wilderness Survival Tools _ End-time.jpeg
*   image path = LARNMERN Steel Toe Boots Men Work Puncture Proof Non Slip Safety Boot Industrial Construction Comfortable Outdoor Hiking Military Tactical Shoes.jpeg
*   image path = Opinel No_ 8 Garden Knive.jpeg
*   image path = Red Rock Outdoor Gear Military Style Lensatic Compasses, 2 Pack.jpeg
*   image path = REVIEW _ Vinjatek.jpeg
*   image path = Silky Gomboy 240 Folding Saw Review_ The Ultimate Tool for Campers and Woodworkers!.jpeg
*   image path = Sofirn SC21 Mini Small Flashlight 1000 Lumen, USB Rechargeable Keychain Light with Super Bright LH351D LED, Magnetic Tail, Small Pocket Sized EDC Flashlight High Lumens(Black_5000K).jpeg
*   image path = SunnySports Deal of the Day_ Hillsound Trail Crampon.jpeg
*   image path = Suunto Ambit2 Black.jpeg
*   image path = Today In Gear_ EST Gear’s 18-In-1 Outdoor Multitool, How to Grill a Better Steak & More _ Gear Patrol.jpeg
* */