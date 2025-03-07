-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eHT_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_eHT_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0", 2 to 3=> "1", 4 => "0", 5 => "1", 6 => "0", 7 => "1", 8 to 9=> "0", 
    10 => "1", 11 to 14=> "0", 15 to 19=> "1", 20 to 23=> "0", 24 to 25=> "1", 26 => "0", 27 => "1", 
    28 to 31=> "0", 32 to 35=> "1", 36 => "0", 37 => "1", 38 => "0", 39 => "1", 40 => "0", 
    41 => "1", 42 to 45=> "0", 46 => "1", 47 => "0", 48 => "1", 49 to 50=> "0", 51 => "1", 
    52 => "0", 53 to 55=> "1", 56 => "0", 57 to 58=> "1", 59 => "0", 60 to 61=> "1", 62 => "0", 
    63 to 64=> "1", 65 => "0", 66 => "1", 67 => "0", 68 => "1", 69 => "0", 70 => "1", 
    71 to 73=> "0", 74 to 77=> "1", 78 to 81=> "0", 82 => "1", 83 => "0", 84 to 85=> "1", 86 => "0", 
    87 => "1", 88 to 89=> "0", 90 => "1", 91 to 94=> "0", 95 => "1", 96 => "0", 97 => "1", 
    98 to 103=> "0", 104 to 105=> "1", 106 => "0", 107 to 110=> "1", 111 => "0", 112 => "1", 113 to 114=> "0", 
    115 to 116=> "1", 117 to 118=> "0", 119 to 120=> "1", 121 => "0", 122 to 124=> "1", 125 => "0", 126 to 129=> "1", 
    130 to 131=> "0", 132 => "1", 133 => "0", 134 => "1", 135 => "0", 136 => "1", 137 to 139=> "0", 
    140 => "1", 141 to 142=> "0", 143 to 146=> "1", 147 => "0", 148 to 150=> "1", 151 to 152=> "0", 153 to 155=> "1", 
    156 to 158=> "0", 159 => "1", 160 => "0", 161 => "1", 162 => "0", 163 to 166=> "1", 167 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_eHT is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_eHT is
    component predict_ensemble_eHT_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eHT_rom_U :  component predict_ensemble_eHT_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


