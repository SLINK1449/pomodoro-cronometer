import tkinter as tk
import time
import threading

# Default time in seconds (25 minutes)
WORK_TIME = 25 * 60



class PomodoroApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Pomodoro")
        self.root.geometry("400x100")
        self.root.configure(bg='black')
        self.root.wm_attributes("-topmost", True)     # Keep always on top
        self.root.wm_attributes("-alpha", 1)        # Transparent background
        self.running = False
        self.remaining = WORK_TIME

        # Timer display
        self.label = tk.Label(root, text=self.format_time(self.remaining),
                              font=("Consolas", 24), bg='black', fg='white')
        self.label.pack()

        # Start/Pause button
        self.start_btn = tk.Button(root, text="Start", command=self.toggle_timer,
                                   bg='gray20', fg='white', width=10)
        self.start_btn.pack(pady=5)

    def format_time(self, seconds):
        minutes, secs = divmod(seconds, 60)
        return f"{minutes:02}:{secs:02}"

    def toggle_timer(self):
        if not self.running:
            self.running = True
            self.start_btn.config(text="Pause")
            threading.Thread(target=self.run_timer).start()
        else:
            self.running = False
            self.start_btn.config(text="Start")

    def run_timer(self):
        while self.remaining > 0 and self.running:
            time.sleep(1)
            self.remaining -= 1
            self.label.config(text=self.format_time(self.remaining))
        if self.remaining == 0:
            self.label.config(text="DONE")
            self.start_btn.config(text="Start")
            self.running = False

if __name__ == "__main__":
    root = tk.Tk()
    app = PomodoroApp(root)
    root.mainloop()
