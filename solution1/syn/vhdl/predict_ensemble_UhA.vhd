-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_UhA_rom is 
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


architecture rtl of predict_ensemble_UhA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 7=> "0", 8 => "1", 9 to 13=> "0", 
    14 to 16=> "1", 17 to 20=> "0", 21 to 22=> "1", 23 => "0", 24 to 26=> "1", 27 to 28=> "0", 29 to 30=> "1", 
    31 to 33=> "0", 34 => "1", 35 to 36=> "0", 37 to 40=> "1", 41 to 42=> "0", 43 to 46=> "1", 47 to 52=> "0", 
    53 to 54=> "1", 55 => "0", 56 => "1", 57 to 59=> "0", 60 => "1", 61 to 62=> "0", 63 to 67=> "1", 
    68 => "0", 69 => "1", 70 => "0", 71 to 73=> "1", 74 to 76=> "0", 77 => "1", 78 => "0", 
    79 to 83=> "1", 84 to 85=> "0", 86 to 87=> "1", 88 to 89=> "0", 90 => "1", 91 => "0", 92 to 94=> "1", 
    95 to 97=> "0", 98 => "1", 99 => "0", 100 => "1", 101 => "0", 102 to 104=> "1", 105 to 108=> "0", 
    109 => "1", 110 => "0", 111 to 113=> "1", 114 to 116=> "0", 117 => "1", 118 => "0", 119 => "1", 
    120 => "0", 121 => "1", 122 to 124=> "0", 125 => "1", 126 => "0", 127 => "1", 128 => "0", 
    129 to 131=> "1", 132 to 133=> "0", 134 to 135=> "1", 136 => "0", 137 => "1", 138 => "0", 139 to 140=> "1", 
    141 to 144=> "0", 145 to 146=> "1", 147 to 148=> "0", 149 to 152=> "1", 153 to 154=> "0", 155 => "1", 156 to 157=> "0", 
    158 to 159=> "1", 160 to 161=> "0", 162 to 164=> "1", 165 to 166=> "0", 167 => "1", 168 => "0", 169 => "1", 
    170 => "0", 171 to 172=> "1", 173 => "0", 174 => "1", 175 to 176=> "0", 177 to 178=> "1", 179 => "0", 
    180 => "1", 181 to 182=> "0", 183 to 187=> "1", 188 to 189=> "0", 190 => "1", 191 => "0", 192 to 194=> "1" );

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

entity predict_ensemble_UhA is
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

architecture arch of predict_ensemble_UhA is
    component predict_ensemble_UhA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_UhA_rom_U :  component predict_ensemble_UhA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


