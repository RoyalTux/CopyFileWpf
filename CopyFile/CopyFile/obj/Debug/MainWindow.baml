   M S B A M L   `   `   `  ����C  ?CopyFile, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:CopyFileCopyFile  5   	   M ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089M3clr-namespace:System.ComponentModel;assembly=SystemSystem.ComponentModel 5   	       CopyFile.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:CopyFile     5   	   Bmy3clr-namespace:System.ComponentModel;assembly=System     5   	     � Title$)  #Копирование файлов��5	   	    � WindowStartupLocation$ CenterScreen=�6$   
�������$	��260��6\   $	��630��6i    � 	Resources 5      ,  &System.ComponentModel.BackgroundWorker   backgroundWoker   WorkerReportsProgress!   WorkerSupportsCancellation��%=   &	          5   
   -   5         .  . 5      5      .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��50 �6   �� 5      $	��120 �6    � ColumnDefinitions 5   
   �� 5      $	��100 �6   �� 5      $	��400 �6   �� 5       $	��130 �6   .+�5"   
   �� $��0��6   $
��Bold"�6    $��0��62   
���   �$��Center=�6S   $��Right=�6n   $��0,12,23,12.4q�6�   .��6�   Откуда:6�   �� 5#   
   -   5         ��Name$ TextFrom��5#      $3��-Откуда скопировать файл?��6$   $��1��6D   $��18(�6T   
��� � �$��0��6u   
�������$��Center=�6�   $��Center=�6�   $	��400��6�   $��30��6�    � ToolTip$e _Введите путь по которому лежит файл для копирования��6�   6Q  �� 5$   
   -   5        	 ��Name$	 OpenFrom��5$      $��2��6#   $
��Bold"�63   
���   �$��0��6Y   $��Center=�6f   $��Center=�6�   $��80��6�   $��30��6�   
�������$��Открыть...��6�   6�   �� 5&   
   $��0��6   $
��Bold"�6    $��1��62   
���   �$��Center=�6S   $��Center=�6n   .��6�   	Куда:6�   �� 5'   
   -   5        $ TextTo��5'      $/��)Куда скопировать файл?��6"   $��1��6@   $��18(�6P   
��� � �$��1��6q   
�������$��Center=�6�   $��Center=�6�   $	��400��6�   $��30��6�   $m gВведите путь куда нужно скопировать выбранный Вами файл��6�   6P  �� 5(   
   -   5        $	 OpenTo��5(      $��2��6!   $
��Bold"�61   
���   �$��1��6W   $��Center=�6d   $��Center=�6   $��80��6�   $��30��6�   
�������$��Открыть...��6�   6�   � 5*   
   -   5        
 �Name$
 ProgressBar��5*      $��10��6+   $y�Hidden=�6:   $	��582��6N   $��39��6Z   $��Center=�6f   $��Center=�6�   $��2��6�   $��23,9.8,25.4,72q�6�   $��3��6�   �� 5+   
   -   5        $
	 Copy��5+      $��20(�6   $��35��6-   $��Center=�69   $��Center=�6V   $
��Bold"�6q   
��� � �$��2��6�   
�������$��Копировать��6�   $��66,65.2,65,20.6q�6�   $	��269��6�   $��1��6  �� 5,   
   -   5        $	 
CopyCancel��5,      $y�Hidden=�6%   $��20(�69   $��46��6G   $��Center=�6S   $��Center=�6p   $
��Bold"�6�   
���  ��$��2��6�   
����ح�$��Отмена��6�   $	��205��6�   $��2��6�   $��1��6  $��300,64.8,25.4,10q�6  6/  5-      5/      